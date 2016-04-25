module EmailsHelper
  def top_words responses
    email = responses.first.email
    common_words = ['this', 'that', 'with', 'some']
    t = responses.map{ |r| r.content.downcase.gsub(/[^a-z0-9\s]/i, '') }.join().
      split.delete_if{ |x| common_words.include?(x) || x.length < 4 }.
      group_by(&:itself).values.max_by(100){ |v| v.size }.
      map { |ary| { 'text'.to_sym => ary.first, 'weight'.to_sym => ary.count } }
    t.each do |word|
      word[:link] = email_path(email, inpWord: word[:text])
    end
    return t
  end

  def top_words_resps responses
    question = responses.first.question
    common_words = ['this', 'that', 'with', 'some']
    t = responses.map{ |r| r.content.downcase.gsub(/[^a-z0-9\s]/i, '') }.join().
      split.delete_if{ |x| common_words.include?(x) || x.length < 4 }.
      group_by(&:itself).values.max_by(100){ |v| v.size }.
      map { |ary| { 'text'.to_sym => ary.first, 'weight'.to_sym => ary.count } }
    t.each do |word|
      word[:link] = survey_resps_path(question: question, inpWord: word[:text])
    end
    return t
  end
end
