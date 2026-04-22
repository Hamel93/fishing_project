class AssistantController < ApplicationController
  def index
    @messages = [
      {
        role: "assistant",
        content: "Salut ! Pose-moi tes questions sur la pêche, les lacs du Québec, les poissons et les leurres."
      }
    ]
  end

  def create
    question = params[:question].to_s.strip

    @messages = []
    @messages << { role: "assistant", content: "Salut ! Pose-moi tes questions sur la pêche, les lacs du Québec, les poissons et les leurres." }

    if question.present?
      @messages << { role: "user", content: question }
      @messages << { role: "assistant", content: fake_ai_answer(question) }
    end

    render :index, status: :ok
  end

  private

  def fake_ai_answer(question)
    q = question.downcase

    if q.include?("doré") || q.include?("walleye")
      <<~TEXT
        Pour le doré, les meilleurs choix sont souvent :
        - jig avec leurre souple
        - cuillère ondulante
        - crankbait dans des tons naturels

        Le doré est souvent plus actif tôt le matin et en fin de journée.
        Cherche les structures rocheuses, les cassures et les zones plus profondes.
      TEXT
    elsif q.include?("truite")
      <<~TEXT
        Pour la truite, essaie souvent :
        - petite cuillère
        - spinner
        - petit poisson nageur
        - mouche, selon le type de pêche

        La truite aime généralement les eaux plus fraîches et oxygénées.
        Le printemps et l’automne sont souvent de très bonnes périodes.
      TEXT
    elsif q.include?("brochet")
      <<~TEXT
        Pour le brochet, les leurres efficaces sont souvent :
        - spinnerbait
        - jerkbait
        - crankbait
        - gros leurre souple

        Le brochet attaque souvent près des herbiers, des bordures et des zones peu profondes.
      TEXT
    elsif q.include?("leurre")
      <<~TEXT
        Le choix du leurre dépend du poisson recherché, de la saison, de la profondeur et de la clarté de l’eau.

        En général :
        - doré : jig, leurre souple, crankbait
        - truite : cuillère, spinner, mouche
        - brochet : spinnerbait, jerkbait, gros leurre souple
        - achigan : topwater, leurre souple, crankbait
      TEXT
    elsif q.include?("lac") || q.include?("québec")
      <<~TEXT
        Le Québec offre énormément de lacs intéressants pour la pêche.

        Quelques facteurs importants pour choisir un lac :
        - espèces présentes
        - accessibilité
        - saison
        - profondeur
        - type de structure

        Tu peux me demander par exemple :
        “Quel leurre utiliser pour le doré au Québec ?”
      TEXT
    elsif q.include?("poisson")
      <<~TEXT
        Au Québec, les poissons souvent recherchés incluent :
        - doré
        - truite
        - brochet
        - achigan
        - saumon dans certaines zones

        Dis-moi quel poisson t’intéresse et je pourrai te suggérer des leurres et des techniques.
      TEXT
    else
      <<~TEXT
        Je peux répondre à tes questions sur :
        - les lacs du Québec
        - les poissons
        - les leurres
        - les techniques de base

        Exemple :
        “Quel leurre utiliser pour la truite ?”
      TEXT
    end
  end
end
