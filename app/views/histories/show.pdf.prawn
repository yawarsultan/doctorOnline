prawn_document() do |pdf|
pdf.font "Helvetica"
pdf.text "First Name: #{@history.firstname}", :spacing => 4, :class => "col-xs-6 col-sm-6 col-md-6"
pdf.text "Last Name: #{@history.lastname}", :spacing => 16
pdf.text "Patient Age: #{@history.age}"
pdf.text "Reason: #{@history.reason}"
pdf.text "Doctor: #{@history.user.firstname}"

end