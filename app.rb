require 'sinatra'
require 'date'

get '/' do
  erb :index
end

post '/folgas' do
  @groups = params['groups'].to_i
  @period = params['periods'].to_i
  @initial_date = nil

  case @groups
  when 1
    @initial_date = Date.new(2024, 12, 7)
  when 2
    @initial_date = Date.new(2024, 12, 14)
  when 3
    @initial_date = Date.new(2024, 12, 21)
  else
    halt 400, "Grupo inválido"
  end
  
  halt 400, "Periodo inválido" if @period <= 0

  @folgas = []
  current_date = @initial_date

  while current_date < (@initial_date >> @period)
    @folgas << current_date
    current_date += 21
  end

  erb :folgas
end
