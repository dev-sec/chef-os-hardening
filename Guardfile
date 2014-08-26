# encoding: utf-8

# Guardfile

guard :rubocop do
  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

guard :foodcritic, cookbook_paths: '.', cli: '-f any --tags ~FC023' do
  watch(/attributes\/.+\.rb$/)
  watch(/providers\/.+\.rb$/)
  watch(/recipes\/.+\.rb$/)
  watch(/resources\/.+\.rb$/)
  watch(/metadata.rb/)
end

guard :rspec do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^(recipes)\/(.+)\.rb$/)     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }
end

guard :kitchen, all_on_start: false do
  watch(/test\/.+/)
  watch(/^recipes\/(.+)\.rb$/)
  watch(/^attributes\/(.+)\.rb$/)
  watch(/^files\/(.+)/)
  watch(/^templates\/(.+)/)
  watch(/^providers\/(.+)\.rb/)
  watch(/^resources\/(.+)\.rb/)
end
