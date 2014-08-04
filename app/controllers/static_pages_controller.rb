class StaticPagesController < ApplicationController
  def home
  
    @series_a = []
    @series_b = []
    @data1 = Hash.new
    @data2 = Hash.new
    client = TinyTds::Client.new(:username => 'test_report', :password => 'test0!', :host => 'miroglio-dev.it')
    result = client.execute("USE test_report")
    result.do
    result = client.execute("SELECT Txn_Week, SUM(Avg_Full_Price), SUM(Qty_Eq) FROM Sim_Store GROUP BY Txn_Week ORDER BY Txn_Week")
    result.each(:as => :array, :cache_rows => false) do |row|
      @data1[row[0]] = row[1]
      @data2[row[0]] = row[2]
    end
  end
end
