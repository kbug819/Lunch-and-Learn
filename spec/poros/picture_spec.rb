require 'rails_helper'

describe Picture do
  it 'exists' do
    attributes = 
    {
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
          }
    picture = Picture.new(attributes)
    expect(picture).to be_a Picture
    expect(picture.alt_tag).to eq("standing statue and temples landmark during daytime")
    expect(picture.url).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5MTQyOTR8MA&ixlib=rb-4.0.3")
  end
end