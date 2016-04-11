module EmailsHelper
  def top_words responses
    common_words = ['this', 'that', 'with', 'some']
    responses.map{ |r| r.content.downcase.gsub(/[^a-z0-9\s]/i, '') }.join().
      split.delete_if{ |x| common_words.include?(x) || x.length < 4 }.
      group_by(&:itself).values.max_by(100){ |v| v.size }.
      map {|ary| { 'text'.to_sym => ary.first, 'weight'.to_sym => ary.count } }
  end
end
