module HomeHelper
	def render_team
		content = ''
		@team.each_slice(6) do |row|
			content << render_team_members(row)
		end
		return content.html_safe
	end

private
	def render_team_members(row)
		content_tag('div', :id => 'team-row', :class => 'row') do
			row.map do |person|
				content_tag('div', render_team_member(person), :class => ['column', 'two'])
			end.join.html_safe
		end
	end

	def render_team_member(person)
		render(:partial => "home/team_member", :layout => false, :locals => {:person => person})
	end

end