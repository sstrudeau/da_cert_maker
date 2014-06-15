#!/usr/bin/env jruby

require 'pdf_ravager'
require 'csv'

if ARGV[0].nil? || ARGV[1].nil?
  puts "Usage Example: make_certificate.jar template_form.pdf names.csv"
  exit
end

pdf_form = ARGV[0]
csv_file = ARGV[1]
  
CSV.foreach(csv_file) do |row|
  name = row[0]
  template = PDFRavager::Template.new do |p|
    p.text 'name', name
  end

  template.ravage pdf_form, out_file: "#{name}.pdf", read_only: true
end

