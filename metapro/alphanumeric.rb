def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

# 上記メソッドをStringClassに組み込む
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end


# refinementsを利用
module StringExtensions
  refine String do
    def to_alphanumeric_with_refine
      gsub(/[^\w\s]/, '')
    end
  end
end


class ExpandString
  using StringExtensions

  def to_alphanumeric(string)
    string.to_alphanumeric_with_refine
  end
end
