FactoryGirl.define do
  factory :account, class: CltWorkerAccount do
    type 'CltWorkerAccount'
    name 'Account CLT'
    warn_straight_hours true
    warn_overtime true
    warn_rest_period true
    allowance_time 0

    factory :account_sequence do
      sequence(:name) { |n| "Account CLT #{n}" }
    end

  end

  factory :self_employed_account, class: SelfEmployedAccount do
    type 'SelfEmployedAccount'
    name 'Freelance for Company X'
    hourly_rate 30

    factory :self_employed_account_sequence do
      sequence(:name) { |n| "Account Self Employed #{n}" }
    end

  end

  factory :student_account, class: StudentAccount do
    type 'StudentAccount'
    name 'Studies Control'
    workload 14400

    factory :student_account_sequence do
      sequence(:name) { |n| "Studies Control Account #{n}" }
    end

  end

end
