module Helpers

	def fol_file(foldername,filename,content)

		directory foldername do
			owner "apache"
			group "apache"
			mode "0755"
		end

		file filename do
			content "#{content}"
			owner "apache"
			group "apache"
		end
	end

end

