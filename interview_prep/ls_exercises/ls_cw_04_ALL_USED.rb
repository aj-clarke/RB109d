=begin
Question:
Longest Vowel Chain

FIRST ATTEMPT: Unknown | SECOND ATTEMPT: 9:40

The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Obtain longest vowels substring from input string and return the length (integer) of that substring

Input: String
Output: Integer (refereces the largest substring length)
Rules:
  Explicit Requirements
  - Input string will always be lowercase
    - Will only be alphabetic characters (vowels and consonants)
    - Will have no spaces
  - Return length of the longest vowel substring

  Implicit Requirements

-----------------------
Modeling:
"codewarriors" == 2
Iterate through String to create substrings
[[c], [co], [cod], [code], [codew], [codewa],...[codewarriors], [o], [od],...[io],....[s]]
Select only substrings where all characters are vowels
[[o], [e], [a], [i], [io], [o]]
Obtain length of longest substring ==> 2

vowels = 'aeiou'


-----------------------
Examples:
solve("codewarriors") == 2
solve("suoidea") == 3
solve("iuuvgheaae") == 4

-----------------------
Scratch Pad:
Something to reference vowels

nested iteration with all? used to select only substrings with vowels

-----------------------
Data Structure:
Algorithm:
< Given a string as input >

Initialize `substrings` to an empty collection
Initialize `result` to an empty collection

Iterate through `string` from first index position `outer` to the last index position

  Iterate through `string` from `outer` index position stepping through each character via `inner` to the last index position to capture substrings.

    #Push the substring into `substrings` collection /if/ all characters are vowels

Iterate through substrings, and Initialize `result` to return of selecting only those that are all vowels

Return the largest substring count (integer) from `substrings`

-----------------------
Code:
=end

def solve(str)
  # vowels = ['a', 'e', 'i', 'o', 'u']
  substrings = []

  (0...str.size).each do |outer|
    (outer...str.size).each do |inner|
      substrings << str[outer..inner].size if str[outer..inner].chars.all? { |char| 'aeiou'.include?(char) }
                        # p substring if         substring.chars.all? { |char| 'aeiou'.include?(char) } # testing understanding
    end
  end

  # result = substrings.select do |substring|
  #   substring.chars.all? { |char| 'aeiou'.include?(char) }
  # end

  # substrings.map! { |ele| ele.length }.max
  substrings.max#_by { |substring| substring.size }
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

p solve("eatzkzinojpyuworymvjzgteveuaayxuwaeeueeoihfrutuhitgkjkgutksdjnclgcacauoalgpxppjxgoktivwizmhinujknauuukxnmjevceeyuucaileuxsiigwoyquhoopuzoihzeauomoouibaxaeuhiajweenlvqsqemsorvsdeeytloxwpbefoskahxtlicsjdnkxaaoeijmluwyulubvjuapotoccfwoumuluhaueaafkhcgueafikaavkorapiposjgfeeydafuuxsyzuqoojialuzuyhiedticeoaiivtxbxwthosugmwairspioitioopnwdafmhcvulieqkuraomycswfxuisxtxfbamgyeleiqjuerfaeiqjyerhmgqcuddveuyyuydcnayvnoooenkmeemqkaez")
p solve("eogmarqdciaarizebjthvinwvgieispfpwkaxumaioiehuiaypgiogiefoaouubuyevutuzevxcyrqdkrisnfouivuhfzbgsclpupezydatwuuiisleolacaonmieipmaaszbsaowbbvfweustkejotjtugdmbzwcwiviicapaaydaayljuwiervvgtmmobxuuoijbxpllsifpwbewbdwogcxeekprtuvjzchwuomyfvuxlayplumelqbaaoeusnezixotamiihamswiuaibmawrjefatopvuczojweriqhzzpehofimiokaoainzugrmodawuzoijaikqooruscoadekelbrbqrpiinnbihjlpriupmsylrefzkyiizuojbymreeiiailmaueqteboiprvxlyxuoshxoeozfurreqiuioucbmzvenodfigefaoopxmalyoextdvvusntfebwgvpmaijazipueaooiegirgedobaavopuiutauoxgynjqasaomtfugygpekraiiokamclgjiufemuojarptknzdesoaopajevyttsufjauavsrdiriazibgnmkfmyrxuipkxyudemdrycbadhhierllkobukojhqouatrzaoiuqetuimduqoeeenitqdynuaaepriyioakvuywleybkeeibyccubjvauovjzywfuez")
p solve("msfxuiljhkgauepiioiurfceiuzcgwowaemfwuayoipotrazkuyaipkdloviqugwcohuzomofdhhqaaeixyuiobkvvjecvtcxaesevcddzlnceqjkngiojoiiobfndeszepiqwbuupynqoaodqqgaujoofeuoibizestbpebaqcjakumuoqvcaalgrduiuiluctaeuudafilnueuoaabazaqucfsduuuelersciijbvaqhjeihiyaehbqdizioiareokquofuqutyiswwirweebajeiioemsstteehiaekdaiaumuudjryaooamqgoiohecvwfuaagczhkfomaomgnblpuynimirlfaflflgiiubjelwkqieibgcpijwooiryxkyoixcsansmptoaufpriyukzxvipasouefeathpoaodxggkvmhz")
p solve("oqpasocgnokzgeuoyrjayuxcmdyadwozjeipoauooacsiwdrcvypmubxeuoejclxaaprwloovyeoiwiwcozvojuyferxjwqauuxaiexabateutmikldocqaiyrenwpnadfaijgotogmisltpiaauioxbaheroultosdoucpaieeiysokwidkeyqdwteeaeymgedoueenpiaozojarqupzobgjjesiiquatuerxeovzapgdzkibzouroyjmcdiuaumlqpefeuogewuuuocngtviaeiadqwxkwtecfkjwukiacswauoiiholleceyoeiufidgpkunycamibriolxujihacwrnuamvuheibiibflbipgxyemeuuuonsolrutcskyuoxcsgtiqasz")
p solve("uufinpnjupfmdnpeauoeahucheuxirmdlfpeickinyvziemuxaamzpuxjaeyyuaaiuaacoxmguueqmqbqiavdwejlapeqdkdstxkvnfoeeaeeaineznoeeipnwraeqqbtlikplohayufequuneuoghtzuizniieuispatokuciuaepqrnezdxbvmkmujopgnnisgoddktumdrdtucrbowpsujizhzziwyalaorvedaijoovjqdsjtfajiigaoidjsngozmusoiyivtauwogkavwozlxaqsoevpahnfejlhsqksessmxgucairwotovuuyhjanosfwuwuposielchtmcoaxoaalipudahcfieiwtinbiiufecdzaxuswfwngjaofuaiipvvqexktieaymsmeivafouezkrieazuvauxuabdbzzlkurcyguuenmrutkdcazvuneiluimkwxoepautwvexeghotuvuhithexaueuisiyovpsoioaveuuhohuioebwyiotizewekcpileobiqbalipz")




# SECOND ATTEMPT - Very similar to first

# def solve(str)
#   substrings = []

#   (0...str.size).each do |start_idx|
#     (start_idx...str.size).each do |end_idx|
#       if str[start_idx..end_idx].chars.all? { |char| 'aeiou'.include?(char) }
#         substrings << str[start_idx..end_idx]
#       end
#     end
#   end
#   substrings.max_by { |substring| substring.size }.size
# end
