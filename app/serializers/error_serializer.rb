class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialized_json
    {
      errors: [
        {
          message: @error.error_message,
        }
      ]
    }
  end
end