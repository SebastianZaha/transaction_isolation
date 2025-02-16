require 'active_record/errors'

module ActiveRecord
  # This exception represents both deadlocks and serialization conflicts.
  # Deadlocks happen when db engine is using lock-based concurrency control.
  # Serialization conflicts happen when db engine is using multi-version concurrency control.
  # Often db engines combine both approaches and thus generate both types of errors.

  class TransactionIsolationConflict < ::ActiveRecord::WrappedDatabaseException
    if ActiveSupport::VERSION::MAJOR == 3
      def initialize message, original_exception = nil
        super(message, original_exception)
      end
    end
  end
end
