# frozen_string_literal: true

class JsonStrategy
  def initialize
    @strategy = FactoryBotRails.strategy_by_name(:create).new
  end

  delegate :association,
           to: :@strategy

  def result(evaluation)
    @strategy.result(evaluation).to_json
  end
end
