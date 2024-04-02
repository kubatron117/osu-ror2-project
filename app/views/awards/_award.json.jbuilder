json.extract! award, :id, :name, :award_kind, :dependent_on_award, :minimum_service_years, :minimum_age_for_award, :created_at, :updated_at
json.url award_url(award, format: :json)
