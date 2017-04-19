prawn_document() do |pdf|
pdf.font "Helvetica"
pdf.text "Patient Name: #{@presription.name}", :spacing => 4, :class => "col-xs-6 col-sm-6 col-md-6"
pdf.text "Patient Email: #{@presription.user_email}", :spacing => 16
pdf.text "Patient Age: #{@presription.age}"
pdf.text "Drug name: #{@presription.drug_name}"
pdf.text "Disease: #{@presription.disease}"
pdf.text "Quantity: #{@presription.quantity}"
pdf.text "Doctor: #{@presription.user.firstname}"

end