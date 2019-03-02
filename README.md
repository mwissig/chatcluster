#A basic chat app using Rails and ActionCable

[https://chatcluster.herokuapp.com/](On Heroku)

Testing real-time updates using ActionCable

1. rails g channel CHANNELNAME<br/>
  creates CHANNELNAME_channel.rb<br/>
  in def subsribed: <br/>
    stream_from "CHANNELNAME_channel"
    
2. in controller for model associated with channel:<br/>
  def create<br/>
    @model = MODEL.new(model_params)<br/>
      if @model.save<br/>
        ActionCable.server.broadcast 'CHANNELNAME_channel"<br/>
                              content: @model.column<br/>
   end<br/>
end

3. in routes.rb<br/>
  mount ActionCable.server, at '/cable'<br/>

4. On form:<br/>
    form_for(@model, remote: true)
    
5. in CHANNELNAME.coffee<br/>
    received: (data) -><br/>
          COFFEESCRIPT ACTION IN RESPONSE TO RECIEVED DATA <br/>
          (ex. alert data.column produces an alert)
          
 TO DEPLOY ON HEROKU:
 
1.  add gem 'kramdown', '1.10.0'<br/>
       gem 'redis', '3.3.1'
       
2. in terminal:<br/>
    heroku addons:create redistogo
    
3. in terminal:<br/>
    heroku config | grep REDISTOGO_URL<br/>
    copy url this returns<br/>
    
  4. in cable.yml<br/>
production:<br/>
  adapter: redis<br/>
  url: THE URL YOU GOT IN STEP 3
    
5. in production.rb add<br/>
   config.action_cable.url = 'wss://appname.herokuapp.com/cable'<br/>
  config.action_cable.allowed_request_origins = [<br/>
  'https://appname.herokuapp.com' ]
  

    
 
       
 
