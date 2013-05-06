require 'json'
require 'pathname'
require '../config/environment'

readdir = ARGV[0]


Dir.glob(File.join(readdir, "*.json")).each do |filename|
  basename = Pathname.new(filename).basename.to_s
  category = basename.to_s.gsub(".json", "")

  data = JSON.load(File.open(filename).read())
  if(!data.nil? and !data[0].nil? and data[0].has_key?("date"))
    new_array = data.collect{|r| 

      name = r["name"]
      if(name.match(/^[A-Z]*/)[0].size>1)
        name = name.split(",").collect{|a|a.strip}.reverse.join(" ")
        name = name.split(" ").collect{|a|a.capitalize}.join(" ")
      else
        name2 = name.split(/,|;/)[0]
        name = name2 unless name2.nil? or name2.size==0
        name2 = name.split(/Dies|Is|Dead|of/)[0]
        name = name2 unless name2.nil? or name2.size==0
      end

      id = r["url"].gsub(/.*?res=/,"")

      {:name=>name, :date=>r["date"], :id=>id,
       :s=>r["sentences"].size, :g=>r["gender"][0]}
    }

    # no need to store male obituaries in this dataset
    culled_array = new_array.reject{|r|r[:g] =="m"}

    obituaries = culled_array.collect{|r|r[:id]}

    topic = Topic.find_by_name(category)
    if topic.nil?
      topic = Topic.create!({:name=>category, :obituaries => obituaries.to_json})
      puts "created #{category}"
    end

    obituaries.each do |obituary|
      if Obituary.find_by_nyt_id(obituary).nil? 
        Obituary.create!({:nyt_id=>obituary})
        print "o"
      else
        print "."
      end
    end

  end
end
  
