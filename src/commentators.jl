export summarize_comments
export emo, fervent, personalized, wrong

function summarize_comments()
    for commentator in [emo, fervent, personalized, wrong]
        println("[$commentator]")
        commentator()
        println()
    end
end

function emo()
    println("I wish knowledge about julia would fill the void in my soul.")
end

function fervent()
    println("I now see the light! Julia will save the world!")
end

function personalized()
    println("Hello, I'm Benoit and I haven't much to say yet.")
end

function wrong()
    println("Having the workshop on the moon is great.")
end