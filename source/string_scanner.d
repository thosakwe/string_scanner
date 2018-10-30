module string_scanner;
import std.regex;

class StringScanner
{
public:
    @property bool isDone() const
    {
        return position >= source.length - 1;
    }

    @property int position() const
    {
        return _position;
    }

    @property int position(int value)
    {
        // TODO: Assertions
        return _position = value;
    }

    @property Captures lastCaptures()
    {
        return _lastCaptures;
    }

    char peekChar() const
    {
        // TODO: Assertions
        return substr[_position + 1];
    }

    char readChar()
    {
        // TODO: Assertions
        return substr[_position++];
    }

    bool matches(string pattern)
    {
        immutable Captures m = matchFirst(substr(), pattern);

        if (m.empty)
        {
            return false;
        }
        else
        {
            _lastCaptures = m;
        }
    }

    bool scan(string pattern)
    {
        if (!matches(pattern))
        {
            return false;
        }
        else
        {
            _position += _lastCaptures.length;
            return true;
        }
    }

    void expect(string pattern)
    {
        if (!scan(pattern))
        {
            // TODO: throw
        }
    }

    void expectDone()
    {
        if (!isDone)
        {
            // TODO: throw
        }
    }

private:
    Captures _lastCaptures;
    int _position;
    string source;

    string substr()
    {
        return source[_position .. $];
    }
}
