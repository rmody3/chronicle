
class GuardianAPI
	include HTTParty
	
	class Endpoints
		BASE_URL = "https://content.guardianapis.com"
		SEARCH_URL = "#{BASE_URL}/search?q="
		API_PARTIAL_URL = "&api-key=#{ENV['GUARDIAN_API_KEY']}"
		COMPLETE_URL = "#{SEARCH_URL}#{API_PARTIAL_URL}"

		 # example for rest of 
		# debate&tag=politics/politics&from-date=2014-01-01&api-key=test
	end

	def query(search)
		request = HTTParty.get(Endpoints::SEARCH_URL+search+Endpoints::API_PARTIAL_URL).to_json
		@request_hash = JSON.parse(request)
	end

	# current_page = @request_hash["response"]["currentPage"]
	# num_of_pages = @request_hash["response"]["pages"]
	# num_of_articles_on_pages = @request_hash["response"]["pageSize"]

	# {"response"=>
	# 	{"status"=>"ok", 
	# 		"userTier"=>"developer", 
	# 		"total"=>13740, 
	# 		"startIndex"=>1, "pageSize"=>10, "currentPage"=>1, "pages"=>1374, "orderBy"=>"relevance", 

	# 		"results"=>[{"id"=>"lifeandstyle/2016/dec/27/rachel-roddys-tuscan-beef-stew-recipe", "type"=>"article", "sectionId"=>"lifeandstyle", "sectionName"=>"Life and style", "webPublicationDate"=>"2016-12-27T12:00:11Z", "webTitle"=>"Rachel Roddy’s Tuscan beef stew recipe | A Kitchen in Rome", "webUrl"=>"https://www.theguardian.com/lifeandstyle/2016/dec/27/rachel-roddys-tuscan-beef-stew-recipe", "apiUrl"=>"https://content.guardianapis.com/lifeandstyle/2016/dec/27/rachel-roddys-tuscan-beef-stew-recipe", "isHosted"=>false}, {"id"=>"lifeandstyle/wordofmouth/2016/nov/24/how-to-cook-the-perfect-beef-stroganoff", "type"=>"article", "sectionId"=>"lifeandstyle", "sectionName"=>"Life and style", "webPublicationDate"=>"2016-11-24T08:00:28Z", "webTitle"=>"How to cook the perfect beef stroganoff", "webUrl"=>"https://www.theguardian.com/lifeandstyle/wordofmouth/2016/nov/24/how-to-cook-the-perfect-beef-stroganoff", "apiUrl"=>"https://content.guardianapis.com/lifeandstyle/wordofmouth/2016/nov/24/how-to-cook-the-perfect-beef-stroganoff", "isHosted"=>false}, {"id"=>"sustainable-business/2017/feb/21/cow-crowd-sustainable-beef-organic-food-seattle", "type"=>"article", "sectionId"=>"sustainable-business", "sectionName"=>"Guardian Sustainable Business", "webPublicationDate"=>"2017-02-21T17:54:39Z", "webTitle"=>"Raising the steaks: the Seattle startup crowdfunding sustainable beef", "webUrl"=>"https://www.theguardian.com/sustainable-business/2017/feb/21/cow-crowd-sustainable-beef-organic-food-seattle", "apiUrl"=>"https://content.guardianapis.com/sustainable-business/2017/feb/21/cow-crowd-sustainable-beef-organic-food-seattle", "isHosted"=>false}, {"id"=>"world/2017/jan/10/whitbread-restaurant-chain-sorry-over-pork-found-in-beef-lasagne", "type"=>"article", "sectionId"=>"world", "sectionName"=>"World news", "webPublicationDate"=>"2017-01-10T09:50:47Z", "webTitle"=>"Whitbread restaurant chain sorry over pork found in beef lasagne", "webUrl"=>"https://www.theguardian.com/world/2017/jan/10/whitbread-restaurant-chain-sorry-over-pork-found-in-beef-lasagne", "apiUrl"=>"https://content.guardianapis.com/world/2017/jan/10/whitbread-restaurant-chain-sorry-over-pork-found-in-beef-lasagne", "isHosted"=>false}, {"id"=>"books/2016/dec/27/wheres-the-beef-the-weirdest-stories-from-2016s-autobiographies", "type"=>"article", "sectionId"=>"books", "sectionName"=>"Books", "webPublicationDate"=>"2016-12-27T18:00:12Z", "webTitle"=>"'Where's the beef?' The weirdest stories from 2016’s autobiographies", "webUrl"=>"https://www.theguardian.com/books/2016/dec/27/wheres-the-beef-the-weirdest-stories-from-2016s-autobiographies", "apiUrl"=>"https://content.guardianapis.com/books/2016/dec/27/wheres-the-beef-the-weirdest-stories-from-2016s-autobiographies", "isHosted"=>false}, {"id"=>"lifeandstyle/2016/dec/08/northern-thai-fish-beef-laap-salads-ben-chapman-cook-residency", "type"=>"article", "sectionId"=>"lifeandstyle", "sectionName"=>"Life and style", "webPublicationDate"=>"2016-12-08T12:30:04Z", "webTitle"=>"Two spicy Thai salad recipes: fish and beef laaps", "webUrl"=>"https://www.theguardian.com/lifeandstyle/2016/dec/08/northern-thai-fish-beef-laap-salads-ben-chapman-cook-residency", "apiUrl"=>"https://content.guardianapis.com/lifeandstyle/2016/dec/08/northern-thai-fish-beef-laap-salads-ben-chapman-cook-residency", "isHosted"=>false}, {"id"=>"sustainable-business/2016/oct/04/meat-antibiotics-mcdonalds-chick-fil-a", "type"=>"article", "sectionId"=>"sustainable-business", "sectionName"=>"Guardian Sustainable Business", "webPublicationDate"=>"2016-10-04T20:53:52Z", "webTitle"=>"We're eating more antibiotic-free chicken. But what about beef?", "webUrl"=>"https://www.theguardian.com/sustainable-business/2016/oct/04/meat-antibiotics-mcdonalds-chick-fil-a", "apiUrl"=>"https://content.guardianapis.com/sustainable-business/2016/oct/04/meat-antibiotics-mcdonalds-chick-fil-a", "isHosted"=>false}, {"id"=>"lifeandstyle/lostinshowbiz/2017/jan/12/chris-brown-soulja-boy-taking-the-beef-to-boxing-ring", "type"=>"article", "sectionId"=>"lifeandstyle", "sectionName"=>"Life and style", "webPublicationDate"=>"2017-01-12T17:32:35Z", "webTitle"=>"Chris Brown v Soulja Boy: taking the beef to the boxing ring", "webUrl"=>"https://www.theguardian.com/lifeandstyle/lostinshowbiz/2017/jan/12/chris-brown-soulja-boy-taking-the-beef-to-boxing-ring", "apiUrl"=>"https://content.guardianapis.com/lifeandstyle/lostinshowbiz/2017/jan/12/chris-brown-soulja-boy-taking-the-beef-to-boxing-ring", "isHosted"=>false}, {"id"=>"media/2017/feb/11/jk-rowling-piers-morgan-trump-twitter-spat", "type"=>"article", "sectionId"=>"media", "sectionName"=>"Media", "webPublicationDate"=>"2017-02-11T20:00:24Z", "webTitle"=>"Fantastic beefs and where to find them: JK Rowling at war with Piers Morgan", "webUrl"=>"https://www.theguardian.com/media/2017/feb/11/jk-rowling-piers-morgan-trump-twitter-spat", "apiUrl"=>"https://content.guardianapis.com/media/2017/feb/11/jk-rowling-piers-morgan-trump-twitter-spat", "isHosted"=>false}, {"id"=>"lifeandstyle/2016/dec/23/beef-shin-stew-recipe-doughnuts-prune-cream-thomasina-miers", "type"=>"article", "sectionId"=>"lifeandstyle", "sectionName"=>"Life and style", "webPublicationDate"=>"2016-12-23T17:00:21Z", "webTitle"=>"The weekend cook: Thomasina Miers’ recipes for slow-cooked shin of beef, and doughnuts with armagnac", "webUrl"=>"https://www.theguardian.com/lifeandstyle/2016/dec/23/beef-shin-stew-recipe-doughnuts-prune-cream-thomasina-miers", "apiUrl"=>"https://content.guardianapis.com/lifeandstyle/2016/dec/23/beef-shin-stew-recipe-doughnuts-prune-cream-thomasina-miers", "isHosted"=>false}]}}



end