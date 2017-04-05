require 'yaml'
class Customer


    def self.page_content(title)
      File.read("order/#{title}.yml") #Reads a YAML file from Orders/
    rescue Errno::ENOENT # Errno::ENOENT raises an error if files is not found  and can caouse the HTTP request to stop
      return nil #return nil
    end

    def self.save_content(title,comment,date,starter,main,dessert,drink)

         File.open("order/#{title}.yml",'w') do |file|#Write mode
            customer= {
                        Date:  "#{date}",
                        Starter:  "#{starter}",
                        Main:  "#{main}",
                        Dessert:  "#{dessert}",
                        Drinks:  "#{drink}",
                        Comments:  "#{comment}"}
          file.print(customer.to_yaml)
        end
    end

    def self.delete_content(title)
      File.delete("order/#{title}.yml")
    end
end


# attr_accessor :comment,:starter,:main,:dessert,:drink,:date

# def initialize(details)
#   @starter=details[:starter]
#   @main=details[:main]
#   @dessert=details[:dessert]
#   @drink=details[:drink]
#   @date=details[:date]
#   @comment=details[:comment]
# end



# @starter=starter
# @main=main
# @dessert=dessert
# @drink=drink
# @date=date
# @comment=comment
