class Admin::BpanelController < Admin::BaseController
  def index
    @title = []
    @link = []

    agent = Mechanize.new
    page = agent.get('http://club.qingdaonews.com/topic_hot.php')
    page.search('//table')[2].search('tr').each do |tr|
      # tr.search('td').each do |td|
      # puts td.text
      # end
      if tr.search('td')[3].text.to_i > 20000
        @title << tr.search('td')[1].text + "\t" + tr.search('td')[3]
        @link << tr.css('a')[0]['href']
      end
    end
  end
end