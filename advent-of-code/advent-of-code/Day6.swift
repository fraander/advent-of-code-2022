//
//  Day6.swift
//  advent-of-code
//
//  Created by Frank Anderson on 12/6/22.
//

import Foundation

class Day6Abstract {
    static func run(input: String, repeats: Int) -> String {
        let inputs = input.split(separator: "\n").map { str in
            String(str)
        }
        
        let outputs = inputs.map { str in
            return peel(string: str, buffer: "", count: 0, repeats: repeats)
        }
        
        var r = outputs.reduce("") { partialResult, int in
            return partialResult + " " + String(int)
        }
        r.removeFirst()
        return r
    }
    
    static func peel(string: String, buffer: String, count: Int, repeats: Int) -> Int {
        guard let char = string.first else {
            return -1;
        }
        
        // 3 seen so far, and the fourth is not one of those three...
        let combined = buffer + String(char)
        if buffer.count == repeats - 1 && Set(combined).count == combined.count {
            return count + 1
        } else {
            var sOut = string
            var bOut = buffer
            
            // if the buffer is full, add the current char to it after removing the first char
            if bOut.count == repeats - 1 {
                bOut.removeFirst()
            }
            bOut.append(sOut.removeFirst())
            
            return peel(string: sOut, buffer: bOut, count: count + 1, repeats: repeats)
        }
    }
}

class Day6Problem1: Challenge {
    static func run(input: String) -> String {
        return Day6Abstract.run(input: input, repeats: 4)
    }
    
    static func check() -> Bool {
        return Day6Problem1.run(input: Day6_SampleInput) == Day6_P1_SampleOutput
    }
}

class Day6Problem2: Challenge {
    static func run(input: String) -> String {
        return Day6Abstract.run(input: input, repeats: 14)
    }
    
    static func check() -> Bool {
        return Day6Problem2.run(input: Day6_P2_SampleInput) == Day6_P2_SampleOutput
    }
}

let Day6_SampleInput = """
mjqjpqmgbljsphdztnvjfqwrcgsmlb
bvwbjplbgvbhsrlpgdmjqwftvncz
nppdvjthqldpwncqszvftbrmjlhg
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
"""
// first start of where four chars in a row are all different

let Day6_P2_SampleInput = """
mjqjpqmgbljsphdztnvjfqwrcgsmlb
bvwbjplbgvbhsrlpgdmjqwftvncz
nppdvjthqldpwncqszvftbrmjlhg
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
"""

let Day6_P1_SampleOutput = "7 5 6 10 11"
let Day6_P2_SampleOutput = "19 23 23 29 26"

let Day6_RealInput = """
zdrrgvvntvtzzssgcgqqbvqqzmqmrrprjjpmpwpvpqpwppfqqnvvjbjcbbrnnvwnvnqnncvvqnvqvmmdzdrzzjmmfzmztzczzjpjllgzgnzgznzpzhhvppmjjtbjbjgbjjpfphfhthpprbbzzhbzzvjjsttjwtjwjllzplzlhlqlfqfvflfvlvqvqsshccgffvzzqllpjllcqcpqcpqccbgcccvwvlldclcppcggjhhtbhbrbwbllldndhnnmnmcccvfvtftrfttlhttgltlflgflfrrftrtrgrmggbccnvccvssbmsmnsmszmmsbshbhpbhhtccnmngmnnntznttwnnmffdccrhrshhzhszslzlqqqsqhhrrvmrrhrmhrrdppshpssjhhhtzhzpzzzbrrqqhhtltgltgghlhpphmmbllczcgcrgcrcmmdjdvdssdbsshqqrprhrfrqrlldggpglplqlgqqvfqqwhqqclcwwbrbwbzzmcczqqpzpzhpzprrsbsfsgscsvsdsnntssgzsgzzdpdmmvnnnnfgngnqntnqnhqnhnrrdvrdvvhcvhcvvmffmccdndhhpghgwwdpwwsbwwwcpchcmmznnvtvfffzgffmfdmdsdrrsjjblbglgrrnllzrlrnnrzztnnnqlnlhnllnflllvjjdpdnngfnnlzlrzllrnlnznszzhhvggbqqcmqqvhqhhzfznnhthlhfllqwwghwgwnnnrcchffqnqjjmhjmjsjrjjrwjrrhbhfbhffprprhrddscddbbrzrvrcclttppvrvrlrplpffdwffwrwvvmssgjjbttpgpfplffgfwfnnmhhwghhpfptprtrzzwlwnwmwzzbmbrrdjrjzjpzpggftffglgzzdgzgbbzwzrrdzdhdbhhfppvrvrrrshrrzwwhjwwtjjhbhgbbhjhmmcvvchcfczfcffgttzbzssdqqjwjbbhthgthghthghmhlmmjwmwccfftnnddlffntnhtnhhnnldlhlthhqvhqvhhcgclcmmcnnwnqqzgzczccftfzfrrnhnjhhnlljdjhjghhchvchvchcphpnnnznhnjjlmjlmlbmmsbmbnnmqmvmhhcrcvvqffjpjzpjzjnnhsnhsslqlqvqzzmffdtfdffjrfjrjcjzjnjfjdfjfvjvddtntcttcwcqwqlqjqlqrrzccsgsgffwddrldrrhlllgppghphddqttdwtwnwlnlccmwwfnngvnvddwvwttjjsgghcchjjnvnccjljcljcljjjrttdstsmsggdbdbnddqpddbqqpbpdpgdpdnpnbnffcfrfrfhfcfgcfgcffvjvccgscshhvthvthtbhtbbmppjjrjqrjqjmjzjjjvffmbbfppndngnrnsnnmbbcmcddfzdfzdffqssfwsfwwpzpfpmpqpjqjwqqzwqwvvsddvrrdsrszrrrjqrjjqtqftthhmpmhpmhphggjsggjpppmhmzzdllcscpsswsqqjsqsvvlffmwgtmbthswfqqppsdflzhmdbcnzgdrlzccsdtptgmhfhwtbwqdhptvsvgdfdsmvsrtjjthchmbrjpmrwhgrdllphnfhrfdlgqmbrtdwcmcbphrzthflcswnhqmfhwprbgczbmsmjvbwjftgfqhbhqgzsvcpplzgctzggfljbmhsmwcwltllqgqtvhlbnpzpccbsbhpvhttdjvcnbqhlccdcclwfvcqnttlzzhqpltnnzzlnwtgppwfvmjhtmlzbzdrgbpbbmwlczdwmfhsvpnhpcqwzlnzslncdcqblvlpqfzhhszzrssvhglsllbbmjngfjlpjjvjbzbrlrmwfvzbgtzvcrshtsswhjrjvtwwbrqvtqnndndthfgfcnprpwwtffcvmllngsftrnwnjmwfljjtwnqqmphdlctvdpnsmbrhmljzmfvhcpblmwjjgqvslgslpbjzqzgzpwgssljztmztbwbqlfwrwgvwrjzvpvncqpdspgpzsjnvcrtzpnspvmnvssbgmsbpdsmcvjmtczczzsjcqcfhvcmsbsjfsssvzpvrtmmgptpcsrjslgvclflhjdpwtsmrgjjcftjmjrzrpwqlqvrqjpflbgrfhswbpcnvrrwpzqtzmqjspqqpwlcwgwgclpnwhhrrmzvvnjrjgjfqftlwjrggjgsdfvqhghmshczbbcvrmsgfdqhhmpfzqtbqwsmwfnwfwndjtlntzbbhlzlhrlzgljlmlbcwcdzbctlbqjmfpdwfcfnrbztvlwjhgmfvjcclcrwwwwvqshnfthtcccnswnfzlznlfcmcfrrsjqfvrwjvtbrwggzmdglcbzfdflrdqsjhzcjpghdmwhzrshnqqtsrccbhnlqcsclwmnvjpfqjszwrqnvbgmcdsvhntqmmnrdpbtpqwvhztmtjfvdplgzhhgsrnbwggnwzbtzwcsbrftzhvwtrwvcqrbcnqnrcmbmsvlcfbmzfcvqpwsmmfdgssnhghwjlsslmgnrqgpmbhpqzfnvztsjzjqgrzbbdpvtprwdzdszlhpcgwvdfvhtbtpfjnqnpzwplrwnfdpdclwgnrjlzzshhcchswtzrcmrfpgwjvttqfbbsdnctrtnmwqsmnfsgfgplphcrhglcrnrbzvcfrdfhdtsjmnvfwslcntttqzvhhbljzmpmlsrsblhvmvphppdmjfzwfmflcfwwtdfcndqzgsbrcppsngqfnnjtccnmfjqzhdpnnrqvhrmnrwntqrvmlzfrdszhctzjjdwqrrldtqgrztrvdfrpgprqhqrbnmpfzzlprrpqgtqmzshpcdbwgmrqhrvvgwvspqzmsrvprvsclffwhzlvgfgcsjtmnmthwfmdnfccvlbwbcrlsghhpzcvcnffvccsqjtnhhnbwgfjmqczbrfmjtmmbznspmvtcvdllbgrcvtdzpgzcjzqdjpglhbbnbvwztrdhcrcvrpbshwlmdbmpdgzzflglwgfhvngcgpwshfhzsbrmnhrftmcfqdhnmfmdzbzfgggrzchtzrhgtjpqhdglgdhdqzqpmqmtsbbjjgvtrngdvghwdmgnmdlwsvpmldlsjrtwhltfpbmqlngncwspcptphdppdmjfvtnmdrpbwzrdzcqjdnprpcddjqjhpllsrqzdpcpnplmnmwfqjtnfmnwljbsfgwlgjpwdbbqblvsqcvvgmbrhsqjcscsflcfdzbnrflmrpzhzdhzqhgvmtfjpwtfqnclplgwrjtfvrncjlqtqlrrnjsrvpwbrdcppvnjfzdrzhcltpdfgfndvqtqzvvztgzssdsvvvjwrtjmqcchbjmppqzmgwqdvmmdqbcpbmcnjsvjlwmmnvmnlzdsnsjpldgpjgsbqmpcdsvhdfhgpbggqmrdhbhvvpnzdpqtmldmfqdfchzdfgddzgvcdzgcwjlhnzjwhpwlfwhgjthjshqtzbblhflmsfvtwplfpmpndgjmhndqlhcvfhmjmmqgnjstrzqvshzbbsfqwszwccmrcjnmlsplqzwrgrcwqbmrfwljmlqtqztscrhgjdqzhvmhncvssfznpgrbrjvchsgnjjnnqqrqwsqsrgmltvgtjvpztwmsspjtqdwrbftzrbcmdthmztmnqtmmnffqjjzbvwghrsdmbbjsnnhbdcbqsbcdmwqqppcvsndzbfnsgtpptdftrfthdclqrqvmhnddmjzlnfgscfdwjljjgjnddcrzvclfqbdhprttwpmsnzvdgzwmnzznpqhlhhslwgzlczlgvbjbgqdczztzjnswphllncbsqdmbsbqqsltzmmhmhfnngbttvdsmfrpgthwpfdhsstrjssghlrrlhbmgdsvhzvlhhfvtcrrhlndgrjjcgmjwgnjtlmpmzgqgpnpsvlnthgrvsdfcnmzmthqzfpjdqjbhgmjqsqvvdldrgqwlghdlwqdbfmffgvzmptqhnvbrdbqtcjmsdnjljpbrtcvvnffvztbwfnmtvdbnshlbgvbnljntlrldbwqvqmblnvhwtw
"""
