# test methoda of observers

class ObserverNotIncluded < StandardError; end

# This helper lets you enable/disable observers during testing. 
module ObserverSpecHelper
  def with_observer_disabled(observer, observed_class, &block)
    raise ObserverNotIncluded unless observer.observed_classes.include?(observed_class)
    disable_observer(observer, observed_class)
    result = yield block
    enable_observer(observer, observed_class)
    result
  end

  def with_observer_enabled(observer, observed_class, &block)
    enable_observer(observer, observed_class)
    result = yield block
    disable_observer(observer, observed_class)
    result
  end

  def enable_observer(observer, observed_class)
    observer.send :add_observer!, observed_class
  end

  def disable_observer(observer, observed_class)
    observed_class.delete_observer(observer)
  end

end
