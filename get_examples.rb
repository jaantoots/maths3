#!/usr/bin/env ruby

require 'json'

data = File.read('_data.json')
courses = JSON.parse(data)

courses.each do |dir, course|
  if course['notes']
    `wget -nv -N -P _local/#{dir} #{course['notes']}`
  end
  if course['altnotes']
    course['altnotes'].each do |_, url|
      `wget -nv -N -P _local/#{dir} #{url}`
    end
  end
  if course['sheets']
    course['sheets'].each do |_, sheet|
      `wget -nv -N -P _local/#{dir} #{sheet['url']}`
      if sheet['sol']
        `wget -nv -N -P _local/#{dir} #{sheet['sol']}`
      end
    end
  end
end
