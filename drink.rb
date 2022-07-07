puts #商品を選んでください#
puts "[0]コーラ110円\n[1]水100円\n[2]レッドブル200円"

# initializeを２つ設定したい場合は2つ以上の場合は引数で２つ設定
class Drink
    @@money = 0
    def initialize(pay_account)
        @pay_account = pay_account
    end
    
    #デフォルト値が0に設定 :0
    # def initialize(pay_account:0)
    #     @pay_account = pay_account
    # end
    
    # =0 でもデフォルト値設定可能
    # def initialize(pay_account = 0)
    #     @pay_account = pay_account
    # end
    
    
    def drink_item
        your_item = gets.to_i
        
    #TMレビューcaseで記入
        if your_item == 0
            your_item = "コーラ"
        elsif your_item == 1
            your_item = "水"
        elsif your_item == 2
            your_item = "レッドブル"
        end
        
    #ローマ字で記入/Rubyはシンボルで文字列を記入
    #シンボルと文字列は一緒、メモリーの使用量が違う　文字列は都度都度違うメモリーを使用、シンボルは同じメモリを利用する。
        buy_item = {:cola => 110,:water => 80,:redbull => 210}
        buy_item = {"コーラ" => 110,"水" => 80,"レッドブル" => 210}
        
        puts "あなたの買う飲み物 #{buy_item[your_item]}"
        @pay_account = buy_item[your_item]
    end
    
    def pay_account=(pay_account)
        @pay_account = pay_account
    end

        
    
    def drink_money    
        puts "お金を投入してください"
        money = gets.to_i
        
        change =money - @pay_account
        
        puts "=購入した金額=="
        puts @pay_account
        puts "=投入したお金="
        puts money
        puts "============="
        #足りない場合の「足りません」の条件分岐の記入
        puts change
    end
end

#数値以外で入力された時の例外処理はどうするか
#例外処理をキャッチアップ
drink = Drink.new(gets.to_i)
drink.drink_item
drink.drink_money

#アプリケーションでは例外処理が重要
#ユーザは想像外の行動するため性悪説で設計
#外部APIを叩きに行くときに、クライアントとしてClassを作る可能性あり
#キッズウィークエンド　zoom api / slack apiを叩く時にclass利用
#redis nosqlみたいなもの　読み込みが早い
#データベースに接続は負荷が高い
