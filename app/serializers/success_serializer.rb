class SuccessSerializer
  def initialize(success)
    @success = success.message
  end

  def serialized_json
    {
      success: message
    }
  end
end