class CallbackManager
  def initialize
    @before_callback = nil
    @after_callback = nil
    @around_callback = nil
  end

  def register_before(callback)
    validate_callback(callback)
    @before_callback = callback
  end

  def register_after(callback)
    validate_callback(callback)
    @after_callback = callback
  end

  def register_around(callback)
    validate_callback(callback)
    @around_callback = callback
  end

  def execute(operation)
    validate_callback(operation)

    # Before callback
    @before_callback.call if @before_callback

    # Around callback
    if @around_callback
      @around_callback.call(operation)
    else
      operation.call
    end

    # After callback
    @after_callback.call if @after_callback
    @after_callback = nil?
    @before_callback = nil?
    @around_callback = nil?
  end

  private

  def validate_callback(callback)
    return if callback.is_a?(Proc)

    raise ArgumentError, 'Callback must be Proc or Lambda.'
  end
end

before = proc do
  puts 'Starting Operation...'
end

after = proc do
  puts 'Operation Completed.'
end

around = proc do |operation|
  puts 'Around Before'
  operation.call
  puts 'Around After'
end

operation = proc do
  puts 'Processing Data...'
end

manager = CallbackManager.new

manager.register_before(before)
manager.register_after(after)
manager.register_around(around)

manager.execute(operation)
puts
puts 'Ended first execution'
puts
manager.register_after(after)
manager.execute(operation)
