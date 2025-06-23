class NewsQueryModel{
  late String newsHead;
  late String newsDes;
  late String newsUrl;
  late String newsImg;
  // late String content;
// constructor bnanyenge
NewsQueryModel({required this.newsHead,this.newsDes="SOME NEWS",this.newsUrl="SOME URL",this.newsImg ="SOME URL",});
// NEWSQUERYMODELL KA OBJECT BNAYA HAI
factory NewsQueryModel.fromMap(Map news){
  // fir iska instance return krdenge
  return NewsQueryModel(
    // title description etc yeh sb key thi api mai isilye yha pss krwaya hai
    newsHead: news['title'] ?? 'No title', // Default value if null
    newsDes: news['description'] ?? 'No description', // Default value if null
    newsImg: news['image'] ?? '',
    // content: news['content']??'',
  );
}
}