require "yaml"

class FishingAI
  def self.ask(question)
    new(question).answer
  end

  def initialize(question)
    @question = question.to_s
    @normalized_question = normalize(@question)
    @data = YAML.load_file(Rails.root.join("config", "fishing_data.yml"))
  end

  def answer
    fish_key = detect_fish
    lake = detect_lake

    if fish_key && lake
      answer_for_fish_and_lake(fish_key, lake)
    elsif fish_key
      answer_for_fish(fish_key)
    elsif asks_about_lakes?
      answer_for_lakes
    else
      fallback_answer
    end
  end

  private

  def normalize(text)
    I18n.transliterate(text.to_s.downcase)
        .gsub(/[^a-z0-9\s]/, " ")
        .gsub(/\s+/, " ")
        .strip
  end

  def fish_data
    @data["fish"] || {}
  end

  def lakes
    @data["lakes"] || []
  end

  def detect_fish
    fish_data.each do |key, info|
      aliases = Array(info["aliases"]).map { |a| normalize(a) }
      return key if aliases.any? { |name| @normalized_question.include?(name) }
    end
    nil
  end

  def detect_lake
    lakes.find do |lake|
      lake_name = normalize(lake["name"])
      @normalized_question.include?(lake_name)
    end
  end

  def asks_about_lakes?
    keywords = ["lac", "lacs", "quebec", "ou pecher", "ou aller"]
    keywords.any? { |word| @normalized_question.include?(word) }
  end

  def answer_for_fish(fish_key)
    fish = fish_data[fish_key]
    lake_matches = lakes.select { |lake| Array(lake["fish"]).include?(fish_key) }

    response = []
    response << "Pour #{fish_key.capitalize} :"
    response << ""
    response << "Leurres recommandes :"
    Array(fish["lures"]).each { |lure| response << "- #{lure}" }

    response << ""
    response << "Conseils :"
    Array(fish["tips"]).each { |tip| response << "- #{tip}" }

    if lake_matches.any?
      response << ""
      response << "Quelques lacs ou tu peux en trouver au Quebec :"
      lake_matches.each do |lake|
        response << "- #{lake["name"]} (#{lake["region"]})"
      end
    end

    response.join("\n")
  end

  def answer_for_fish_and_lake(fish_key, lake)
    fish = fish_data[fish_key]

    if Array(lake["fish"]).include?(fish_key)
      response = []
      response << "#{lake["name"]} (#{lake["region"]}) contient #{fish_key}."
      response << ""
      response << "Leurres recommandes pour #{fish_key} :"
      Array(fish["lures"]).each { |lure| response << "- #{lure}" }
      response << ""
      response << "Conseils :"
      Array(fish["tips"]).each { |tip| response << "- #{tip}" }
      response.join("\n")
    else
      "#{lake["name"]} est dans la base, mais je n ai pas #{fish_key} comme espece confirmee dans ce lac."
    end
  end

  def answer_for_lakes
    response = []
    response << "Voici quelques lacs du Quebec presents dans la base :"
    response << ""
    lakes.each do |lake|
      fish_list = Array(lake["fish"]).map(&:capitalize).join(", ")
      response << "- #{lake["name"]} (#{lake["region"]}) : #{fish_list}"
    end
    response << ""
    response << "Tu peux me demander par exemple :"
    response << "- Quel leurre pour le saumon ?"
    response << "- Quels lacs pour le dore ?"
    response << "- Est-ce qu il y a de la truite au Lac Saint-Jean ?"
    response.join("\n")
  end

  def fallback_answer
    "Je peux repondre sur les lacs, les poissons et les leurres. Essaie une question comme : Quel leurre pour le saumon ?"
  end
end
