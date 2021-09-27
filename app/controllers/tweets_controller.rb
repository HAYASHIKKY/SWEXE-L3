class TweetsController < ApplicationController
  def index
    @Tweets = Tweet.all.order(tdate: "DESC")
  end
  
  def new
    @Tweet = Tweet.new
  end
  
  def create
    @Tweet = Tweet.new(message: params[:tweet][:message],tdate: Time.current)
    if @Tweet.save
    flash[:notice] = '1レコード追加しました'
    redirect_to '/'
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = '該当レコードを削除しました'
    redirect_to '/'
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(message: params[:tweet][:message])
    flash[:notice] = '該当レコードを更新しました'
    redirect_to '/'
    else
      render 'edit'
    end
  end
end
