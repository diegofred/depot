module ApplicationHelper
    def number_to_currency(value)
        sprintf("$%0.02f", value)
    end
end
