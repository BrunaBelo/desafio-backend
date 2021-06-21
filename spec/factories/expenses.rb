FactoryBot.define do
  factory :expense do
    document_number { 'document_number' }
    issue_date { '2021-06-21 02:31:31' }
    value { '9.99' }
    gloss_value { '9.99' }
    net_value { '9.99' }
    month { 1 }
    year { 1 }
    installment_number { 1 }
    passenger { 'passenger' }
    travel_part { 'passenger' }
    lot_number { 'lot_number' }
    refund { 'refund' }
    restitution { 'restitution' }
    id_documento { '13456' }
    document_url { 'document_url' }
    expense_type { build(:expense_type) }
    parliamentarian { build(:parliamentarian) }
    provider { build(:provider) }
    quota_type { build(:quota_type) }
  end
end
