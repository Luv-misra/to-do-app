require 'sinatra'

set :port , '4200'

class Tasks

	attr_accessor :Task_name , :Task_time , :Task_id , :Task_importance , :Task_complete_status , :Task_urgent 
	def initialize task , id , time 
		@Task_name = task 
		@Task_id = id
		@Task_time = time
		@Task_complete_status = false
		@Task_importance = false
		@Task_urgent = false
	end

	def toggle_importance
		@Task_importance = !@Task_importance
	end

	def toggle_complete_status
		@Task_complete_status = !@Task_complete_status
	end

	def toggle_urgent
		@Task_urgent = !@Task_urgent
	end

	def change_task_name name
		@Task_name = name
	end
end

unique_id = 0
tasks_list = []

get '/' do
	erb:todoapp_front , locals: {:tasks_list=>tasks_list }
end

post '/add_task' do
	New_task = Tasks.new params[:task_name] , unique_id , Time.now
	unique_id = unique_id + 1
	puts unique_id
	tasks_list<<New_task
	redirect '/'
end

post '/importance' do
	task_id = params[:task_id]
	task_object = nil
	tasks_list.each do |task|
		if !task
			next
		end
		if task.Task_id == task_id.to_i
			task_object = task
			break
		end
	end
	if task_object
			task_object.toggle_importance
	end
	redirect '/'
end

post '/urgency' do
	task_id = params[:task_id]
	task_object = nil
	tasks_list.each do |task|
		if !task
			next
		end
		if task.Task_id == task_id.to_i
			task_object = task
			break
		end
	end
	if task_object
		task_object.toggle_urgent
	end
	redirect '/'
end

post '/remove' do
	task_id = params[:task_id]
	tasks_list[task_id.to_i]=nil
	redirect '/'
end

post '/completed' do
	task_id = params[:task_id]
	task_object = nil
	tasks_list.each do |task|
		if !task
			next
		end
		if task.Task_id == task_id.to_i
			task_object = task
			break
		end
	end
	if task_object
		task_object.toggle_complete_status
	end
	redirect '/'
end


























































































