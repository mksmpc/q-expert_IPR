def generate_random_pet(params = nil)
  pet = {
      category:  {
          id:   rand(9999),
          name: RandomWord.nouns.next
      },
      name:      RandomWord.nouns.next,
      photoUrls: random_urls,
      tags:      random_tags,
      status:    random_status
  }

  if params
    pet.merge! params
  end

  pet
end

def random_tags
  size = rand 10
  tags = Array.new(size)
  tags.map! do |tag|
    tag = {
        id:   rand(99999),
        name: RandomWord.nouns.next
    }
  end
  tags
end

def random_status
  statuses = %w[available pending sold]
  statuses.sample
end

def random_urls
  urls = %w[https://picsum.photos/200 https://picsum.photos/200/300]
  if rand > 0.7
    return []
  end
  urls.sample(1 + rand(urls.count))
end

def random_date
  Time.at(rand * Time.now.to_i)
end