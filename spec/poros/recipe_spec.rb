
require 'rails_helper'

describe Recipe do
  it 'exists' do
    country_search = "Thailand"
    attributes =
      {
          recipe: {
              url: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
              label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
              image: "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQD8xPqdmMr6blZ8R5lH2sx79h8I2x6FDPSGBtr%2FqOfSQgIhAPZLBJcXDnTiPMrcPS%2B3vbX9Y70PvdinrPYsL9p6bAnBKrgFCBsQABoMMTg3MDE3MTUwOTg2IgyFpenh94XfktGN5K8qlQXi2vHXkjGApgxzN83zbdSb6FSvAUlQ2q6LFJN%2FxwM4uDznqxga5MLumbQzSupcTiydHCA7moEDu%2FkpeYsxtNNrZ4hnL7edf%2BzqD5k%2F%2Fr8HuUIYIYJ7GfMmNVXL7L8jV7RJoVZaOUKtX9LKDO3KtQZ%2BZ404GikuDSsaoZxYKcaWJkMOfVHtchnh%2BSLUtnR9NdZjro9rNkjWK71DpjGbE70DlLMNwQkcMxqlgqG6%2Fa%2BlZp510a7ZcHSBNHkuUM3KhKoZu8zgswRj9gT8z5YT018Sf6QIgB3ZxPowYq9Ch2cKkQHRZ7JizUClOUQzcDgEmRAPT%2FVNNFAoyEjFSKPiYS7vMCsGY9mDuq%2Bz%2BqDT7zUexo1oln8JbQeludfVbSyaur0yoMvrWPPIDwZaC%2FwAtNDQsQ9BXf97JVH4TkFnTDBb0M47ccieppHKvjDG%2Ffa9HmRwj71C7hoLqwQyzek6f09m6pQJhc%2Fy9GZ821lxMSxx5Vj8oB0OLBYuYqNgTi2JBieb%2B7kEoKHGZXgzRB68TjZzE%2FonCEQtURamtzhovBDvpCK7%2BifV3f6N4xbOGFjObz21hyRoDvL%2BpIlDLPEvpJFPupAJNvLEgFsk9NjcpcJh4TUI%2Bmbp1uC62Gh7zp%2F24mlFDBXjWFBWBDXNtJdUcI19a44LP%2BN3WLsgSt146fzW%2F%2FS%2BLQ%2BOhPkN4lh%2FmHiruUrrmiaE6QP9s4csfzSm6KzRUes0k%2FoMHCCh3w9zh18sOUmyZOdaa0iQ9KlywIn6DNEmg4BpqyqdYjO%2BYXUl83Blzcx9AIYCjXpJIxwT9hFY2dLzJxS4ytQ%2FQYLUhcNwgWYoy%2BsxtB0gdvKLVsTYGdu7aCNwZQiZDxuvtx25JX3017UO%2BaasMMv2vqoGOrABUHixImqU4KScK157RN5duZy5d1dv9k9kA9LoUav%2FbkeJmgc4gUNLnu%2F4tlLm%2Fgca3dcp5s6phWseUX4GhyBSvvPQ13YV%2BlVGn6Rt4i7VuAN%2FZMlPhoXkXVgbtHuaUsJ83NHIvyAk4WWc3b0Y1kgYwyFT9cd20s29XIyC5eaNQq4SgvFbtwEhl6LEWba5ZVP4XbvXrt9NQh9d%2F2R2DKaln3CzRp3XTkUXuwDKyWBhdt4%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231111T190439Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLTN4LIPC%2F20231111%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7c14a26fd531865cd5d30b6dfa51743cac95060eb3a102e29ddd36fca2752ca9",
                     }}
    recipe = Recipe.new(attributes, country_search)

    expect(recipe).to be_a Recipe
    expect(recipe.id).to eq(nil)
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(recipe.country).to eq(country_search)
    expect(recipe.image_url).to eq(attributes[:recipe][:image])
  end
end