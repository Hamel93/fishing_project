require Rails.root.join("app/services/fishing_ai")

class AssistantController < ApplicationController
  def index
    question = params[:question].to_s.strip

    @messages = [
      {
        role: "assistant",
        content: "Salut ! Pose-moi tes questions sur la pêche, les lacs du Québec, les poissons et les leurres."
      }
    ]

    if question.present?
      @messages << { role: "user", content: question }
      @messages << { role: "assistant", content: FishingAI.ask(question) }
    end
  end
end
