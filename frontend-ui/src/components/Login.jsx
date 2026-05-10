import React, { useState } from 'react';
import api from '../api/axios';

const Login = ({ onLoginSuccess }) => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    const handleLogin = async (e) => {
        e.preventDefault(); // This captures the "Enter" key and prevents reload
        setError('');
        setLoading(true);
        try {
            const response = await api.post('/auth/token', { email, password });
            localStorage.setItem('token', response.data);
            onLoginSuccess();
        } catch (err) {
            setError('Invalid email or password. Please try again.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="flex min-h-screen items-center justify-center bg-[#0B0E14] text-white">
            <form onSubmit={handleLogin} className="w-full max-w-md p-10 space-y-8 bg-[#151921] rounded-[2.5rem] shadow-2xl border border-white/5">
                <div className="text-center">
                    <h2 className="text-4xl font-black text-white italic tracking-tighter uppercase">Lumina<span className="text-sky-500">Path</span></h2>
                    <p className="mt-2 text-slate-500 font-medium">Continue your journey</p>
                </div>

                {error && (
                    <div className="p-4 text-xs font-bold uppercase tracking-widest text-red-400 bg-red-400/10 border border-red-400/20 rounded-2xl text-center">
                        {error}
                    </div>
                )}

                <div className="space-y-6">
                    <div>
                        <label className="block text-[10px] font-black uppercase tracking-[0.2em] text-slate-500 mb-2 ml-2">Email Address</label>
                        <input
                            type="email"
                            required
                            value={email}
                            className="w-full p-4 bg-white/5 rounded-2xl border border-white/10 focus:border-sky-500 focus:ring-4 focus:ring-sky-500/10 outline-none transition-all text-sm"
                            placeholder="student@lumina.com"
                            onChange={(e) => setEmail(e.target.value)}
                        />
                    </div>
                    <div>
                        <label className="block text-[10px] font-black uppercase tracking-[0.2em] text-slate-500 mb-2 ml-2">Password</label>
                        <input
                            type="password"
                            required
                            value={password}
                            className="w-full p-4 bg-white/5 rounded-2xl border border-white/10 focus:border-sky-500 focus:ring-4 focus:ring-sky-500/10 outline-none transition-all text-sm"
                            placeholder="••••••••"
                            onChange={(e) => setPassword(e.target.value)}
                        />
                    </div>
                </div>

                <button
                    type="submit"
                    disabled={loading}
                    className="w-full p-4 font-black uppercase tracking-widest bg-sky-500 text-[#0B0E14] rounded-2xl hover:bg-sky-400 shadow-lg shadow-sky-500/20 active:scale-[0.98] transition-all disabled:opacity-50"
                >
                    {loading ? 'Authenticating...' : 'Start Learning'}
                </button>
            </form>
        </div>
    );
};

export default Login;