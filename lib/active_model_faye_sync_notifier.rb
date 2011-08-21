# Broadcast a message to notify all Faye clients that a resource updated.
class ActiveModelFayeSyncNotifier
  def initialize(model)
    @model = model
  end

  def notify
    SyncFaye.new("#{FAYE_SERVER}/faye").send(
      faye_sync_channel,
      faye_sync_data.to_json)
  end

  private

  def faye_sync_channel
    "/sync/#{@model.class.table_name}/#{@model.id}"
  end

  def faye_sync_data
    { @model.id => @model.as_json }
  end
end
