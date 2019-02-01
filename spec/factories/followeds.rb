FactoryBot.define do
  factory :followed do
    name 'Teste'
    external_url 'http://teste.com.br'
    genres 'Teste'
    created_at Time.current
    updated_at Time.current  
  end 
end