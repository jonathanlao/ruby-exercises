require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  # if zipcode.nil?
  #   '00000'
  # elsif zipcode.length < 5
  #   zipcode.rjust(5, '0')
  # elsif zipcode.length > 5
  #   zipcode[0..4]
  # end
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end


puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
end

## Iteration 0

# contents = File.read('event_attendees.csv')
# puts contents

# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line, index|
#   next if index.zero?

#   columns = line.split(',')
#   name = columns[2]
#   p name
# end
