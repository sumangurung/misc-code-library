Spec::Matchers.define :be_registered do |expected|
  match do |actual|
    actual.include?(expected)
  end

  failure_message_for_should do |actual|
    "expected observer with the name of #{expected} to be registered but wasn't"
  end

  failure_message_for_should_not do |actual|
    "expected observer with the name of #{expected} to be not registered but was"
  end

  description do 
    "be included in #{actual}"
  end
end


# ***** USAGE ******
# ActiveRecord::Base.observers.should be_registered(:observer_name)

