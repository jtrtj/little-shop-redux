class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do
    Merchant.update(params[:id], params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do
    Item.update(params[:id], params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.destroy(params[:id])
    redirect '/items'
  end

  get '/invoice' do
    @invoice = Invoice.all
    erb :'invoice/index'
  end

  get '/invoice/:id' do
    @invoice = Invoice.find(params[:id])
    erb :'invoice/show'
  end

  get '/invoice/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoice/edit'
  end

  put '/invoice/:id' do
    Invoice.update(params[:id], params[:invoice])
    redirect "/invoice/#{params[:id]}"
  end

  delete '/invoice/:id' do
    Invoice.destroy(params[:id])
    redirect '/invoice'
  end
end
