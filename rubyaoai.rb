require 'dotenv/load'  # dotenvを読み込む
require 'openai'

# Azure OpenAI Serviceの設定を環境変数から読み込む
OpenAI.configure do |config|
    config.access_token = ENV.fetch("AZURE_OPENAI_API_KEY")  # APIキーを設定
    config.uri_base = ENV.fetch("AZURE_OPENAI_URI")  # エンドポイントURIとモデルを設定
    config.api_type = :azure  # APIタイプをAzureに設定
    config.api_version = "2023-03-15-preview"  # APIバージョンを設定
    config.log_errors = true
end

# チャットリクエストを送信
response = OpenAI::Client.new().chat(
  parameters: {
    messages: [{ role: "user", content: "Azure OpenAI Service の概要を説明する文章をMarkdown形式で作成して"}], # メッセージを設定
    temperature: 0.7, # 応答の多様性を設定
  }
)

puts response.dig("choices", 0, "message", "content")

