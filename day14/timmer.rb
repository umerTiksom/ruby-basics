class Timer
  def initialize
    @task = nil
    @delay = nil
    @interval = nil
    @repeat = false
    @running = false
    @count = 0
  end

  def schedule(task, delay)
    raise 'Task must be Proc or Lambda.' unless task.is_a?(Proc)
    raise 'Delay must be greater than zero.' unless delay.is_a?(Numeric) && delay > 0
    raise 'Another task already scheduled.' if @task

    @task = task
    @delay = delay
    @repeat = false
  end

  def schedule_repeating(task, interval)
    raise 'Task must be Proc or Lambda.' unless task.is_a?(Proc)
    raise 'Interval must be greater than zero.' unless interval.is_a?(Numeric) && interval > 0
    raise 'Another task already scheduled.' if @task

    @task = task
    @interval = interval
    @repeat = true
  end

  def start(check_flag = nil)
    raise 'No task scheduled.' unless @task

    @running = true

    if @repeat
      while @running
        sleep @interval

        @count += 1
        @task.call(@count)

        stop if check_flag && @count >= check_flag
      end
    else
      sleep @delay

      if @running
        @count += 1
        @task.call(@count)
      end

      stop
    end
  end

  def stop
    @running = false
  end
end
task = proc do |count|
  puts "Executed #{count} time(s)"
end

timer = Timer.new
timer.schedule_repeating(task, 1)

timer.start(5)
timer.schedule(task, 2)
