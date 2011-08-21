class Wizard < ActiveRecord::Base
  after_save :notify_clients_of_update

  private

  def notify_clients_of_update
    ActiveModelFayeSyncNotifier.new(self).notify
  end
end
