if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {boat: @boat, review: Review.new})
  json.inserted_item render(partial: "boats/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {boat: @boat, review: @review})
end
