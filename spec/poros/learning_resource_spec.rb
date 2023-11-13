require 'rails_helper'

describe LearningResource do
  it 'exists' do
    country = "Thailand"
    attribute_i = 
    [{
      "id": "gsllxmVO4HQ",
      "slug": "standing-statue-and-temples-landmark-during-daytime-gsllxmVO4HQ",
      "created_at": "2018-06-05T06:50:34Z",
      "updated_at": "2023-11-13T22:04:23Z",
      "promoted_at": nil,
      "width": 5034,
      "height": 3356,
      "color": "#d9d9d9",
      "blur_hash": "L.IrQxRlnhM}yZWFoeS5R+bcogoy",
      "description": "Traveling on motorbike in norther thailand we came across these amazing sculptural temples and buildings.",
      "alt_description": "standing statue and temples landmark during daytime",
      "breadcrumbs": [],
      "urls": {
          "raw": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3",
          "full": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3&q=85",
          "regular": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3&q=80&w=1080",
          "small": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3&q=80&w=400",
          "thumb": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3&q=80&w=200",
          "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1528181304800-259b08848526"
      },
      "likes": 296,
      "liked_by_user": false,
      "current_user_collections": [],
      "sponsorship": nil,
      "topic_submissions": {
          "nature": {
              "status": "rejected"
          },
          "spirituality": {
              "status": "rejected"
          },
          "arts-culture": {
              "status": "rejected"
          },
          "architecture-interior": {
              "status": "rejected"
          }
      }
          }]
    attribute_v =
    {
        "kind": "youtube#searchResult",
        "etag": "9jG4jK6CR5oGC_zkoSl11Xq_AaQ",
        "id": {
            "kind": "youtube#video",
            "videoId": "uw8hjVqxMXw"
        },
        "snippet": {
            "publishedAt": "2021-08-29T10:13:10Z",
            "channelId": "UCluQ5yInbeAkkeCndNnUhpw",
            "title": "A Super Quick History of Laos",
            "description": "Audio Requiring Attribution: LukeIRL: https://freesound.org/people/LukeIRL/sounds/176134/ RTB45: ...",
            "thumbnails": {
                "default": {
                    "url": "https://i.ytimg.com/vi/uw8hjVqxMXw/default.jpg",
                    "width": 120,
                    "height": 90
                },
                "medium": {
                    "url": "https://i.ytimg.com/vi/uw8hjVqxMXw/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                },
                "high": {
                    "url": "https://i.ytimg.com/vi/uw8hjVqxMXw/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                }
            },
            "channelTitle": "Mr History",
            "liveBroadcastContent": "none",
            "publishTime": "2021-08-29T10:13:10Z"
        }
    }
    resource = LearningResource.new(country, attribute_v, attribute_i)
    expect(resource).to be_a LearningResource
    expect(resource.country).to eq(country)
    expect(resource.id).to eq(nil)
    expect(resource.images).to be_an Array
    expect(resource.video).to be_a Hash
  end
end