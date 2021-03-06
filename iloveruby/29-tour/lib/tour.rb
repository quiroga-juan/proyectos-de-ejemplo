
require_relative 'tour/draw'
require_relative 'tour/input'
require 'ruby2d'

data = Input.read(ARGV)
current = 0
max = data[:slides].size - 1
@paint = []
@state = :slide
draw_slide(current, data)

on :key_down do |event|
  case event.key
    when 'left' # previous slide
      current -= 1 if current > 0
    when 'right' # next slide
      current += 1 if current < max
    when '0' # move to slide 0
      current = 0
    when 'i' # show index
      @state = (@state == :slide ? :index : :slide )
      draw_index(data)
    when 'q' # quit
      exit 0
  end
  draw_slide(current, data) if @state == :slide
end

set title: data[:title],
    background: 'navy',
    borderless: false
    #, fullscreen: true
show
