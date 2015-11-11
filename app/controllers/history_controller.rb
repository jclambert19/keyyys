class HistoryController < ApplicationController
  before_action :authenticate_user!

  def show
    @subscriptions = current_user.subscriptions
    @events = []
    @subscriptions.each do |subscription|
      @events << { date_type: "Début de votre abonnement", value: subscription.start_date }
      subscription.bunches.each do |bunch|
        @events << { date_type: "Date de réception du trousseau #{bunch.name}", value: bunch.received_on }
        bunch.missions.each_with_index do |mission, index|
          @events << { date_type: "Date de récupération lors de la mission #{index + 1} pour le trousseau #{bunch.name}", value: bunch.received_on }
        end
      end
      @events << { date_type: "Fin de votre abonnement", value: subscription.end_date }
    end
  end
end
