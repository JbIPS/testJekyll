module Jekyll
  module Collapse
    def collapse(input)
      questions = input.split("<h3")
      output = questions.shift() + '<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">'
      id = 1
      for q in questions
        if q != ""
          output += '<div class="panel panel-default">
          <div class="panel-heading" role="tab" id="question_' + id.to_s + '">
          <h4 class="panel-title">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_' + id.to_s + '" aria-expanded="false" aria-controls="collapse_' + id.to_s + '">'

          tokens = q.split(">")
          j = 0
          for title in tokens
            #if id == 1
            #  puts "Tokens" + tokens.to_s
            #end
            if j == 1
              output += title.split("<")[0]
              if id == 1
                puts "Title" + title.split("<")[0]
              end
            end
            j += 1
          end

          output += '</a></h4></div>
          <div id="collapse_' + id.to_s + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="question_' + id.to_s + '">
          <div class="panel-body">'

          answer = q.split("<p>")
          if answer.length != 1
            output += answer.last.sub('</p>', '')
          end

          output += '</div></div></div>'
        end
        id += 1
      end

      output += '</div>'

      return output
    end
  end
end

Liquid::Template.register_filter(Jekyll::Collapse)
