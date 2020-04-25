class ComplexNum
    attr_accessor :real, :img

    def initialize (real=0, img=0)
      self.real = real
      self.img = img
    end

    def +(cn)
        ComplexNum.new(self.real + cn.real,self.img  + cn.img)
    end

    def *(cn)
        ComplexNum.new(self.real * cn.real - self.img  * cn.img, self.real * cn.img + self.img * cn.real)
    end
end

class ComplexCalculator
    @@stats = {"bulk_add" => 0, "bulk_multiply" => 0};

    def self.get_stats()
        @@stats
    end

    def self.bulk_add(cns)
        cnSum = ComplexNum.new(0,0)
        cns.each do | cn |
            cnSum += cn
        end
        @@stats["bulk_add"] += 1
        cnSum
    end

    def self.bulk_multiply(cns)
        cnSum = ComplexNum.new(1,1)
        cns.each do | cn |
            cnSum *= cn
        end
        @@stats["bulk_multiply"] += 1
        cnSum
    end
end

 c1 = ComplexNum.new(3,2)
 c2 = ComplexNum.new(1,7)
 c3 = c1 * c2

 #puts c3.real #-11
 #puts c3.img  #-23

# c4 = ComplexCalculator.bulk_multiply([c1,c2])
# puts ComplexCalculator.get_stats()["bulk_multiply"]